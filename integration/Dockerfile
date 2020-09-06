FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine 
WORKDIR /integration

COPY integration.csproj .
RUN dotnet restore

COPY . .
ENTRYPOINT ["dotnet", "test","--verbosity=normal"]