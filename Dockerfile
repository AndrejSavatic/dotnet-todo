FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

COPY src/TodoApi.csproj ./
RUN dotnet restore

COPY src/. ./

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS runtime

WORKDIR /app 

COPY --from=build /app/out .

EXPOSE 80

ENTRYPOINT ["dotnet", "TodoApi.dll"]