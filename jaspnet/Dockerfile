# Use the official image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["jaspnet/jaspnet.csproj", "jaspnet/"]   # Adjust "jaspnet/" to match your directory structure
RUN dotnet restore "jaspnet/jaspnet.csproj"
COPY . .
WORKDIR "/src/jaspnet"
RUN dotnet build "jaspnet.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "jaspnet.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "jaspnet.dll"]     # Adjust "jaspnet.dll" to match your built DLL name

