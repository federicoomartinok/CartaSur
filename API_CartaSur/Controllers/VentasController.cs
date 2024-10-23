using Microsoft.AspNetCore.Mvc;

namespace API_CartaSur.Controllers
{
    public class VentasController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
