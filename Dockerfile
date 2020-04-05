# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:3.1    AS build-env
WORKDIR /donetcore-generator-api

COPY donetcore-generator-api/donetcore-generator-api.csproj ./donetcore-generator-api/
RUN dotnet restore donetcore-generator-api/donetcore-generator-api.csproj
COPY tests/tests.csproj ./tests/
RUN dotnet restore  tests/tests.csproj

COPY . .



# test
ENV TEAMCITY_PROJECT_NAME=fake
RUN dotnet test tests/tests.csproj

RUN dotnet publish  donetcore-generator-api/donetcore-generator-api.csproj -o /publish
# Runtime Image Stage
FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS build
WORKDIR /publish
COPY --from=build-env /publish .
ENTRYPOINT ["dotnet", "donetcore-generator-api.dll"]