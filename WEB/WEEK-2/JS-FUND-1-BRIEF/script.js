var pilots = [
    {
        id: 10,
        name: 'Musa Manarov',
        years: 14
    },
    {
        id: 19,
        name: 'Isa Manafov',
        years: 16
    },
    {
        id: 20,
        name: 'Liza Manarov',
        years: 22
    }
];


pilots.forEach(element=>{
    let text=`<ul><li>${element.id}</li>
                <li>${element.name}</li>
                <li>${element.years}</li>
</ul>`
    document.write(text)
})

let text=
pilots.filter(element=>{
    
})