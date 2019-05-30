FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["Coldairarrow.Web/05.Coldairarrow.Web.csproj", "Coldairarrow.Web/"]
COPY ["Coldairarrow.Business/04.Coldairarrow.Business.csproj", "Coldairarrow.Business/"]
COPY ["Coldairarrow.DataRepository/02.Coldairarrow.DataRepository.csproj", "Coldairarrow.DataRepository/"]
COPY ["Coldairarrow.Util/01.Coldairarrow.Util.csproj", "Coldairarrow.Util/"]
COPY ["Coldairarrow.Entity/03.Coldairarrow.Entity.csproj", "Coldairarrow.Entity/"]
RUN dotnet restore "Coldairarrow.Web/05.Coldairarrow.Web.csproj"
COPY . .
WORKDIR "/src/Coldairarrow.Web"
RUN dotnet build "05.Coldairarrow.Web.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "05.Coldairarrow.Web.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Coldairarrow.Web.dll"]