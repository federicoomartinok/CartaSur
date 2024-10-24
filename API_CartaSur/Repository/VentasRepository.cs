using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using API_CartaSur.Models;

namespace API_CartaSur.Repository
{
    public class VentasRepository(IConfiguration configuration)
    {
        private readonly string? _connectionString = configuration.GetConnectionString("DefaultConnection");

        public DateTime ObtenerFechaConMasVentas()
        {
            DateTime fechaMasVentas = DateTime.MinValue;

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                string query = @"SELECT TOP 1 
                                Fecha_venta
                            FROM 
                                VENTAS
                            GROUP BY 
                                Fecha_venta
                            ORDER BY 
                                COUNT(*) DESC;";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    var result = command.ExecuteScalar();
                    if (result != null)
                    {
                        fechaMasVentas = Convert.ToDateTime(result);
                    }
                }
            }

            return fechaMasVentas;
        }
    }
}