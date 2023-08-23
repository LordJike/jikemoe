FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 5282

ENV ASPNETCORE_URLS=http://+:5282

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["jaspnet.csproj", "."]
RUN dotnet restore "./jaspnet.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "jaspnet.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "jaspnet.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "jaspnet.dll"]