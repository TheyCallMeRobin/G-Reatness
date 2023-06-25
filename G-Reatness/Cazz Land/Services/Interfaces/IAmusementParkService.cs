using G-Reatness.Models;

namespace G-Reatness.Services.Interfaces
{
    public interface IAmusementParkService
    {
        Task<List<Parks>> GetAllAsync();
        Task<Parks?> GetByIdAsync(int id);
    }
}