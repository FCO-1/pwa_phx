window.onload = () => {
   
  
  if('serviceWorker' in navigator) {
    navigator.serviceWorker.register('service-worker.js')
     .then(function() { console.log("Service Worker"); });
  }
    var f = updateIndicator()
 
  }

function updateIndicator() {
    console.log(window.navigator.onLine);
    alert("Hola");
  }
  window.addEventListener('online',  updateIndicator);
  window.addEventListener('offline', updateIndicator);