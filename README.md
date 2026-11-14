# FiveM Resource Template

Lua 5.4 + NUI (Svelte 5 JS + Tailwind v4 + Vite, managed with bun).

## Use this template
GitHub → **Use this template** → create your repo, then:
1. Rename the folder to your resource name (`snake_case`).
2. Edit `fxmanifest.lua` (description, author) and `Config.Command`.
3. Build the UI:
   ```bash
   cd web && bun install && bun run build
   ```
4. In `server.cfg`: `ensure <resource_name>` → in game: `/template`.

## Structure
```
fxmanifest.lua
client/ server/        # entry points (main.lua)
config/                # everything owners can tune
  config.<topic>.lua
  functions/           # editable hooks + ESX adapter
web/                   # Svelte 5 (JS) + Tailwind source → builds into html/
html/                  # build output (git-ignored, packed by CI)
```

## UI dev
- `cd web && bun run dev` — develop in a normal browser (NUI calls are no-ops outside the game).
- `bun run build` — outputs to `../html`; `refresh` + `restart <resource>` in the server.
- Lua → UI: `SendNUIMessage({ action = 'x', data = ... })` ↔ `onNui('x', fn)`.
- UI → Lua: `nuiFetch('x', body)` ↔ `RegisterNUICallback('x', ...)`.

## Release
Push a tag (`git tag v1.0.0 && git push --tags`) → GitHub Actions builds the UI and attaches a ready-to-drop `.zip`.

## Conventions
Tabs, single quotes, `Config.PascalCase`, hooks named `Config.ClientXxx` / `Config.ServerXxx` ("will" = returns boolean gate, "ed" = fire-and-forget).
