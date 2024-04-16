var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
var x = 5;
var ys = 3;
var d = 3;

app.MapGet("/", () => "Hello World!");

app.MapGet("/hello", () => "Hello from the other side!");

app.Run();
