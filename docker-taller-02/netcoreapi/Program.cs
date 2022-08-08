var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHttpClient();

var app = builder.Build();

 
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();    
}

app.MapGet("/", () => "Hola DockerWorld!");

app.MapGet("/node", async () =>
{
    var response = new HttpResponseMessage();

    using(var httpClient = new HttpClient())
    {
        response = await httpClient.GetAsync("http://nodeapi:3000/insertar");
    }    
    return response;
})
.WithName("GetNode");

app.Run();