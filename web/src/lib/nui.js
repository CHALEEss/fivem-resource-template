// Lua -> NUI: SendNUIMessage({ action = 'x', data = ... })
export function onNui(action, handler) {
  const listener = (e) => {
    if (e.data?.action === action) handler(e.data.data)
  }
  window.addEventListener('message', listener)
  return () => window.removeEventListener('message', listener) // return from $effect to clean up
}

// NUI -> Lua: RegisterNUICallback('x', function(data, cb) ... cb('ok') end)
export async function nuiFetch(name, body = {}) {
  if (!inGame()) return undefined // running in a normal browser (bun run dev)
  const res = await fetch(`https://${window.GetParentResourceName()}/${name}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json; charset=UTF-8' },
    body: JSON.stringify(body),
  })
  return res.json()
}

export const inGame = () => 'GetParentResourceName' in window
