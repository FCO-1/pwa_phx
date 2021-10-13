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
//self.addEventListener('fetch', function (event) {
//  event.respondWith(
//    caches.open('cache:static:').then(function (cache) {
//      return cache.match(event.request).then(function (response) {
//        return (
//          response ||
//          fetch(event.request).then(function (response) {
//            cache.put(event.request, response.clone());
//            return response;
//          })
//        );
//      });
//    }),
//  );
//});

self.addEventListener('fetch', (event) => {
  event.respondWith(async function() {
    try {
      return await fetch(event.request);
    } catch (err) {
      return caches.match(event.request);
    }
  }());
});
