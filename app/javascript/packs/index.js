let map;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: -34.397, lng: 150.644 },
    zoom: 8,
  });
}

function hello(){
    alert("Michele")
}

document.addEventListener('turbolinks:load', () => {
    const clickButton = document.getElementById("greet-user-button");
    clickButton.addEventListener('click', (event) => {
        initMap('JavaScript')
    });
});