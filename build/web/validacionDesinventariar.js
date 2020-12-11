/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validar() {
    var numCatalogo = document.getElementById("videojuego").value;
    var disponibles = document.getElementById(numCatalogo).value;
    var cantidad = document.getElementById("cantidad").value;
    
    if (parseInt(cantidad, 10) > parseInt(disponibles, 10)) {
        alert("La cantidad ingresada es mayor a lo que esta en el inventario.")
        return false;
    } else {
        return true;
    }
}