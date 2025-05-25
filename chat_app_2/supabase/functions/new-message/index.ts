import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'
import serviceAccount from '../service-account.json' with { type: 'json' }

console.log('Webhook received!')
//console.log(JSON.stringify(payload, null, 2))

// Types
interface Chat {
  username: string
  userId: string
  text: string
}

interface WebhookPayload {
  type: 'INSERT'
  table: 'chat'
  record: Chat
  schema: 'public'
}

// Supabase client
const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

// Handle webhook request
Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json()
  const chat = payload.record

  // Fetch all FCM tokens
  const { data: users, error } = await supabase
    .from('users')
    .select('fcm_token')

  if (error) {
    console.error('Error fetching users:', error)
    return new Response('Error fetching FCM tokens', { status: 500 })
  }

  const tokens = users
    .map((u) => u.fcm_token)
    .filter((token): token is string => !!token)

  if (tokens.length === 0) {
    console.warn('No FCM tokens found.')
    return new Response('No users to notify.', { status: 200 })
  }

  // Get Firebase access token
  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  })

  // Send notification to each user
  const notifications = tokens.map(async (token) => {
    const res = await fetch(
      `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${accessToken}`,
        },
        body: JSON.stringify({
          message: {
            token,
            notification: {
              title: `New message from ${chat.username}`,
              body: chat.text,
            },
          },
        }),
      }
    )

    if (!res.ok) {
      const errorData = await res.json()
      console.error(`Failed to send to ${token}:`, errorData)
    } else {
    console.log('Notification sent successfully')
  }
  })

  await Promise.all(notifications)

  return new Response(JSON.stringify({ success: true }), {
    headers: { 'Content-Type': 'application/json' },
  })
})

// Firebase access token generation
const getAccessToken = ({
  clientEmail,
  privateKey,
}: {
  clientEmail: string
  privateKey: string
}): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    })
    jwtClient.authorize((err, tokens) => {
      if (err || !tokens?.access_token) {
        reject(err || new Error('Failed to get access token'))
      } else {
        resolve(tokens.access_token)
      }
    })
  })
}
