var builder = WebApplication.CreateBuilder(args);
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(80); // Listen on any IP address on the specified port
});
var app = builder.Build();
var x = 5;
var ys = 3;
var fd = 4;
var d = 4;

app.MapGet("/", () => "Hello World!");

app.MapGet("/hello", () => "Hello from the other side!");

app.Run();
