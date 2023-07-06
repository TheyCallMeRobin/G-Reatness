using CMPS339.Models;
using CMPS339.Services.Interfaces;
using Dapper;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace CMPS339.Services.Implementations
{
    public class AmusementParkService : IAmusementParkService
    {
        private readonly ILogger<AmusementParkService> _logger;
        public AmusementParkService(ILogger<AmusementParkService> logger) 
        { 
            _logger = logger;
        }
        public async Task<List<Parks>> GetAllAsync()
        {
            List<Parks> parks = new();

            using (IDbConnection connection = new SqlConnection(ConnectionService.ConnectionString))
            {
               connection.Open();

               var parkData =  await connection.QueryAsync<Parks>("SELECT * FROM Parks WHERE Id = @Id", new { Id = 1 });

               parks = parkData.ToList();
            }

            return parks;
        }

        public async Task<Parks?> GetByIdAsync(int id)
        {
            List<Parks> parks = new();

            using (IDbConnection connection = new SqlConnection(ConnectionService.ConnectionString))
            {
                connection.Open();
                var parkData = await connection.QueryAsync<Parks>("SELECT * FROM Parks WHERE Id = @Id", new { Id = id });

                parks = parkData.ToList();
            }

            return parks.FirstOrDefault();
        }

        public async Task<ParksGetDto?> InsertAsync(ParksCreateDto dto)
        {
            try
            {
                using IDbConnection connection = new SqlConnection(ConnectionService.ConnectionString) ;
                connection.Open();

                IEnumerable<Parks> newPark = await connection
                    .QueryAsync<Parks>("INSERT INTO PARKS VALUES (@Name)", new { Name = dto.Name });

                return newPark
                    .Select(x => new ParksGetDto { Name = dto.Name })
                    .FirstOrDefault();

            }
            catch (Exception e)
            {
                _logger.LogError(e, "An error has ocurred. DTO Value Name: {NAME} At: {TIME}", dto.Name, DateTime.Now.ToString());
                return null;
            }
            return null;
        }
    }
}
