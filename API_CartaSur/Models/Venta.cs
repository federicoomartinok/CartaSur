namespace API_CartaSur.Models
{
    public class Venta
    {
        public int IdVenta { get; set; }
        public DateTime FechaVenta { get; set; }
        public string ? DniCliente { get; set; }
        public int IdEmpleado { get; set; }
        public int IdSucursal { get; set; }
        public decimal ImporteTotal { get; set; }
    }

}
