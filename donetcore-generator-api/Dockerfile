# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:3.1    AS build-env
WORKDIR /donetcore-generator-api

COPY donetcore-generator-api.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -o /publish

# Runtime Image Stage
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS build
WORKDIR /publish
COPY --from=build-env /publish .
ENTRYPOINT ["dotnet", "donetcore-generator-api.dll"]