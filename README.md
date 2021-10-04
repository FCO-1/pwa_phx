# PwaPhx

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


Se soluciono corriendo mix phx.digest, ya que usa ambas partes 
Se uso  la herramienta lighthouse de devtools en chrome para la auditoria del manifest y el service worker 



Vista de pwa de elixir
![image](https://user-images.githubusercontent.com/70904597/135550603-d3a3cef9-a408-4d46-8b2d-f888d215f473.png)


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  * mix digest https://runebook.dev/es/docs/phoenix/phoenix/mix_tasks, https://docs.w3cub.com/phoenix/phoenix/mix.tasks.phx.digest
  * Error de service worker, referencia, por si se presenta:  https://stackoverflow.com/questions/28921937/failed-to-register-a-serviceworker-serviceworker-cannot-be-started

  + Workbox: https://developers.google.com/web/tools/workbox/guides/get-started
  + Manifest: https://blog.apiki.com/web-app-manifest/
  + Informacion sobre pwa: https://pwaexperts.io/tutoriales
  + referencia: https://github.com/botsquad/phoenix-service-worker-example
  + 
