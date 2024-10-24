document.getElementById('form-empleados').addEventListener('submit', function(event) {
    event.preventDefault();    
    var nombre = document.getElementById('nombre').value;
    var apellido = document.getElementById('apellido').value;
    var estado = document.getElementById('estado').value;

    var table = document.getElementById('listado-empleados');
    var row = document.createElement('tr');
    //inserta tabla dinamica
    row.innerHTML = `<td>${nombre}</td><td>${apellido}</td><td>${estado}</td>`;
    table.appendChild(row);


    if (estado === 'Activo') {
        var tablaEmpleadosActivos = document.getElementById('empleados-activos');
        var filaClonada = row.cloneNode(true);
        tablaEmpleadosActivos.appendChild(filaClonada);
    } else {
        //lo mismo que lo de arriba pero simplificado
        var tablaInactiva = document.getElementById('empleados-inactivos');
        tablaInactiva.appendChild(row.cloneNode(true));
    }

    document.getElementById('employee-form').reset();
});

document.getElementById('api').addEventListener('click', function() {
    //podria usar axios
    fetch('https://svct.cartasur.com.ar/api/dummy')
        .then(response => response.text())
        .then(status => {
            document.getElementById('resultado-api').textContent = status;
        })
});
