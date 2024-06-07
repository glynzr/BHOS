// TASK-4 : OPENMAPWEATHER API, by longitute and latitude

const div = document.getElementById('res-list'); // Get the list where we will place our authors

if(navigator.geolocation){
    navigator.geolocation.getCurrentPosition(position => {
        let lon = position.coords.longitude;
        let lat = position.coords.latitude;
        console.log(lon, lat);

        const apiKey = `3d41a5deefdb8039304d267939512f4d`;
        const url = `https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&appid=${apiKey}`;

        fetch(url)
        .then(response => {
            return response.json();
        })
        .then(data => {
            console.log(data);
            let icon = data.current.weather[0].icon ;
            let output = `
            <tr>
            <td> Temperature </td>
            <td> <b> ${Math.floor(data.current.temp - 273)} C </b> </td>
            </tr><tr>
            <td> Humidity</td> 
            <td> <b> ${data.current.humidity} </b> </td>
            </tr><tr>
            <td> Wind speed </td> 
            <td> <b> ${data.current.wind_speed} </b> </td>
            </tr><tr>
            <td> ${data.current.weather[0].description} </td>
            <td> <img src = "http://openweathermap.org/img/wn/${icon}@2x.png"></td>
            </tr>
            `;
            document.querySelector('#res-list').innerHTML = output ;
        });

    });
}


// const url = `https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=3d41a5deefdb8039304d267939512f4d`;
