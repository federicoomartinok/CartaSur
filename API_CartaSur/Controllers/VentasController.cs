using API_CartaSur.Services;
using Microsoft.AspNetCore.Mvc;

namespace API_CartaSur.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class VentasController(VentasService ventasService) : ControllerBase
    {
        [HttpGet("FechaMasVentas")]
        public IActionResult GetFechaConMasVentas()
        {
            DateTime fechaMasVentas = ventasService.ObtenerFechaMasVentas();
            return Ok(fechaMasVentas);
        }
    }
}
