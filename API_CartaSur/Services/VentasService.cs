using API_CartaSur.Repository;

namespace API_CartaSur.Services
{
    public class VentasService(VentasRepository ventasRepository)
    {
        private readonly VentasRepository _ventasRepository = ventasRepository;

        public DateTime ObtenerFechaMasVentas()
        {
            return _ventasRepository.ObtenerFechaConMasVentas();
        }
    }
}

