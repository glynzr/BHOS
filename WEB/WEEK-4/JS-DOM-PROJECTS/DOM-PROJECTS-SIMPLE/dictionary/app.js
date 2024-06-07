const container = document.getElementById('container');
let message = document.getElementById('groups');
let id, txt;
const champLeague = {
    A : {
            'Barcelona': {points: '15', average: '5'},
            'PSJ': {points: '12', average: '3'},
            'Dortmund': {points: '10', average: '0'},
            'Brugge': {points: '4', average: '-5'}
        },
    B : {
            'Ajax': {points: '16', average: '7'},
            'Liverpool': {points: '11', average: '4'},
            'Sparta Prague': {points: '9', average: '2'},
            'Grasshoppers': {points: '2', average: '-3'}
        }
    
};

container.addEventListener('click', (elm) => {
    //console.log(e.target.id);
    id = elm.target.id
    showText(id);
});

function showText(id){
    //alert(id);
    //console.log(champLeague[`${id}`]);
    const entries = Object.entries(champLeague[`${id}`]);
    let txt = '<table><tr><th>Team</th><th>Point</th><th>Average</th></tr>';
    entries.forEach( (el) => {
        console.warn(el[0]);
        txt += `<tr><td> ${el[0]} </td>
                <td> ${el[1]['points']} </td>
                <td> ${el[1]['average']} </td>
                </tr>`;
    });
    txt += '</table>';
    document.getElementById('groups').innerHTML = txt;
}