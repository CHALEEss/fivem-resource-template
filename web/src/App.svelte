<script>
  import { inGame, nuiFetch, onNui } from './lib/nui'

  let visible = $state(!inGame()) // show in browser dev, hidden in game until Lua opens it

  $effect(() => {
    const off = onNui('setVisible', (v) => (visible = v))
    const onKey = (e) => e.key === 'Escape' && close()
    window.addEventListener('keydown', onKey)
    return () => {
      off()
      window.removeEventListener('keydown', onKey)
    }
  })

  function close() {
    visible = false
    nuiFetch('close')
  }
</script>

{#if visible}
  <main class="fixed inset-0 m-auto flex h-fit w-80 flex-col gap-3 rounded-xl bg-zinc-900 p-6 text-white">
    <h1 class="text-xl font-semibold">FiveM Template</h1>
    <button class="rounded bg-indigo-600 px-3 py-2 hover:bg-indigo-500" onclick={() => nuiFetch('ping')}>Ping server</button>
    <button class="rounded bg-zinc-700 px-3 py-2 hover:bg-zinc-600" onclick={close}>Close</button>
  </main>
{/if}
