self.addEventListener('install', function(e) {
  e.waitUntil(
    fetch('/cache_manifest.json')
      .then(function(response) {
        return response.json()
      })
      .then(function(cacheManifest) {
        var cacheName = 'cache:static:' + cacheManifest.version
        var all = Object.values(cacheManifest.latest).filter(
          function(fn) { return fn.match(/^(images|css|js|fonts)/);
          })
        caches.open(cacheName).then(function(cache) {
          return cache.addAll(all).then(function() {
            self.skipWaiting();
          });
        })
      })
  );
});
self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      if (response) {
        return response;
      }
      return fetch(event.request);
    })
  );
});