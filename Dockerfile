FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base

WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["Coldairarrow.Web/05.Coldairarrow.Web.csproj", "./"]
COPY ["Coldairarrow.Business/04.Coldairarrow.Business.csproj", "./"]
COPY ["Coldairarrow.DataRepository/02.Coldairarrow.DataRepository.csproj", "./"]
COPY ["Coldairarrow.Util/01.Coldairarrow.Util.csproj", "./"]
COPY ["Coldairarrow.Entity/03.Coldairarrow.Entity.csproj", "./"]
RUN dotnet restore "05.Coldairarrow.Web.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "Coldairarrow.Web/05.Coldairarrow.Web.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Coldairarrow.Web/05.Coldairarrow.Web.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Coldairarrow.Web.dll"]