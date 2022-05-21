##############
#CÓDIGO USADO NO LIVRO: GESTÃO DA ENERGIA E AUDITORIAS ENERGÉTICAS
#POR: ROGÉRIO DUARTE
#MAIO DE 2022, VERSÃO 0.4
#
#LINGUAGEM: JULIA 1.7.2
#
##############
pwd()
cd("/cd/to/location/of/code/folder/")
pwd()
#
# # § Figura da Nota 1.1. Ajuste a função exponencial
# using Plots
# using LsqFit
# model(t,p)=70 * p[1] .^ (p[2] * (t .- 1860))
# tdata=collect(range(1860,stop=1970,length=12))
# edata=[70 80 115 180 250 400 485 515 630 880 1100 1685]
# p0=[2, .01]
# fit=curve_fit(model,tdata,edata[:],p0)
# param=fit.param
# Plots.plot(
#     tdata,edata[:],
#     legend=:topleft,
#     label="Dados",
#     ylims=(0,2000),
#     yticks=0:1000:2000,
#     xlims=(1860,1980),
#     xticks=1860:40:1980,
#     xlabel="Ano",
#     ylabel="Mtep",
#     lw=3)
# Plots.plot!(
#     tdata,model(tdata,fit.param),
#     lw=3,
#     label = "Ajuste exponencial"
# )
# plot!(size=(300,200))

# # § Figura 1.2. Crescimento demográfico
# using CSV, DataFrames
# using Plots, LaTeXStrings
# data=DataFrame(CSV.File("worldPopulation_UnitedStatesCensusBureau.csv"))
# rename!(data,[:"Ano", :"População"])
# plotCrescDemografExp=Plots.plot(
#     data.Ano,data.População,
#     xlabel="Ano",
#     xguidefontsize=16,
#     xtickfontsize=14,
#     ylabel= L"População $\times 10^{-6}$",
#     yguidefontsize=16,
#     ytickfontsize=14,
#     lw=8,
#     legend=false
# )

# # § Figura 1.3 (PARCIAL). Evolução do PIB nos EUA
# Ano=[
#     1825,
#     1830,
#     1835,
#     1840,
#     1845,
#     1850,
#     1855,
#     1860,
#     1865,
#     1870,
#     1875,
#     1880,
#     1885,
#     1890,
#     1895,
#     1900,
#     1905,
#     1910,
#     1915,
#     1920,
#     1925,
#     1930,
#     1935,
#     1940,
#     1945,
#     1950,
#     1955,
#     1960,
#     1965,
#     1970,
#     1975
# ]
# PIB=[
#     2.4,
#     2.5,
#     2.8,
#     2.7,
#     2.9,
#     3.0,
#     3.4,
#     3.6,
#     3.8,
#     3.9,
#     4.2,
#     5.1,
#     5.3,
#     5.5,
#     5.9,
#     6.6,
#     7.5,
#     8.0,
#     7.8,
#     9.0,
#     10.1,
#     10.0,
#     8.8,
#     11.3,
#     18.9,
#     15.4,
#     17.6,
#     18.3,
#     21.7,
#     24.3,
#     26.3,
# ]
# plotPIB_EUA=Plots.plot(
#     Ano,PIB,
#     legend=false,
#     markersize = 8,
#     xguidefontsize=14,
#     xlims = (1800,2000),
#     xticks=1800:50:2000,
#     xtickfontsize=13,
#     yguidefontsize=14,
#     ylims = (0,30),
#     lw=4,
#     ytickfontsize=14
# )

# # § Figura da Nota 1.3. Evolução da intensidade energética em países de expressão oficial portuguesa
# using Plots
# data=DataFrame(CSV.File("energyIntensityCPLP_WorldBank.csv"))
# plotIntEnergCPLP=Plots.plot(
#     data.Ano,Matrix(data[:,["Angola","Brasil","Cabo Verde","Portugal"]]),
#     xlabel="Ano",
#     xguidefontsize=14,
#     xtickfontsize=14,
#     ylabel="Intensidade energética do PIB\n[MJ / USD(2011)]",
#     yguidefontsize=14,
#     ytickfontsize=14,
#     lw=4,
#     legendfontsize=14,
#     label = ["Angola" "Brasil" "Cabo Verde" "Portugal"]
# )

# # § Figura 1.7: Gráfico de setores circular com emissões de GEE por setor macroeconómico
# using PyCall
# using PyPlot
# pygui(true)
# pygui(:qt5)
# labels = ("Resíduos", "Agricultura", "Uso\ndo\nsolo","Edifícios","Transporte","Ener-\ngia","Indústria","Outros")
# sizes = [3, 14, 18,8,14,24,14,5]
# explode = (0.1, 0.1, 0.1,0,0,0,0,0)  # only "explode" the 1st slice
# fig1, ax1 = plt.subplots()
# ax1.pie(sizes, explode=explode, labels=labels, autopct="%1.1f%%",
#         shadow=true, startangle=90)
# ax1.axis("equal")  # Equal aspect ratio ensures that pie is drawn as a circle.
# plt.show()

# # § Exercício Resolvido 1.1, alínea (c): Gráfico de setores circular com percentagem de consumo de energia final por setor económico
# using PyCall
# using PyPlot
# pygui(true)
# pygui(:qt5)
# labels = ("Agric.&Pescas", "Ind.Extract.", "Ind.Trnsf.","Const&Ob.Pub.","Transportes","Edifícios")
# sizes = [378968,118403,5405141,918228,6894315,5762415]
# fig1, ax1 = plt.subplots()
# ax1.pie(sizes, labels=labels, autopct="%1.1f%%")
# ax1.axis("equal")  # Equal aspect ratio ensures that pie is drawn as a circle.
# plt.show()

# # § Figura 2.8: Taxa de variação do PIB português com média móvel simples
# using CSV, DataFrames
# data=DataFrame(CSV.File("pordataTaxaCrescimPIB.csv"))
# rename!(data,[:"Ano", :"Taxa"])
# moving_average(vs,n) = [sum(@view vs[i:(i+n-1)])/n for i in 1:(length(vs)-(n-1))]
# mov_avg=moving_average(data.Taxa,21)
# mov_avg=prepend!(mov_avg,-99*repeat(1:1, inner = 10))
# mov_avg=append!(mov_avg,-99*repeat(1:1, inner = 10))
# mov_avg=replace(mov_avg,-99 => NaN)
# plottaxaVarPIB=Plots.plot(
#     data.Ano,data.Taxa,
#     xlabel="Ano",
#     xguidefontsize=14,
#     xtickfontsize=14,
#     ylabel="Variação do PIB [%]",
#     yguidefontsize=14,
#     ytickfontsize=14,
#     label = nothing
# )
# Plots.plot!(
#     data.Ano,mov_avg,
#     linewidth=3,
#     label = "Média móvel"
# )

# # § ExercícioResolvido 2.1, alínea (b): Evolução do do consumo primário total, do consumo de petróleo e de gás natural
# using CSV, DataFrames
# using Plots
# data=DataFrame(CSV.File("dataEx2_1_b.csv"))
# plotEx2_0_b=Plots.plot(
#     data.Ano,Matrix(data[:,["Cons.Total","Cons.Petrol","Cons.GN"]]),
#     framestyle = :box,
#     xticks = [1988,1998,2008,2018],
#     xguidefontsize=14,
#     xtickfontsize=14,
#     ylabel="Consumo de energia [Mtep]",
#     yguidefontsize=14,
#     ytickfontsize=14,
#     lw=4,
#     legend=:bottomleft,
#     fg_legend = :transparent,
#     legendfontsize=14,
#     label = ["Total" "Petróleo" "Gás Nat."]
# )

# # § ExercícioResolvido 2.1, alínea (c): Evolução percentual, face ao consumo primário total, do consumo de (petróleo+gás-natural) e de energias renováveis (eletricidade+outras)
# using CSV, DataFrames
# using Plots
# data=DataFrame(CSV.File("dataEx2_1_c.csv"))
# plotEx2_0_c=Plots.plot(
#     data.Ano,Matrix(data[:,["Petrol+GNat","EnergRenov(Elet+Outros)"]]),
#     framestyle = :box,
#     xticks = [1988,1998,2008,2018],
#     xguidefontsize=14,
#     xtickfontsize=14,
#     ylim=(0,100),
#     ylabel="Percentagem do consumo total [%]",
#     yguidefontsize=14,
#     ytickfontsize=14,
#     yticks = [0,20,40,60,80,100],
#     lw=4,
#     legend=:topleft,
#     fg_legend = :transparent,
#     legendfontsize=14,
#     label = ["Petrol+GNat" "EnergRenov(Elet+Outros)"]
# )

# # § Figura 4.5: VAL versus i
# i=range(0.01,.20,20)
# T=[10 20 30]
# NPV1=-5500 .+(850-200).*((1 .+i).^ T .-1)./(i.*(1 .+i).^ T)
# using(Plots)
# Plots.plot(i*100,NPV1/1000, label = ["T=10" "T=20" "T=30"], xlabel="i [%]", ylabel="VAL [kEUR]")

# # § Figura 6.11: Diagrama de Sankey com dados da Tabela 6.2
# using PlotlyJS
# plotsankey=PlotlyJS.plot(sankey(
#     arrangement = "snap",
#     node = attr(
#         label= ["R(870)", "A(70)", "B(500)", "C(250)", "D(90)", "C1(150)", "C2(100)", "D1(30)", "D2(20)", "D3(20)", "D4(20)"],
#         x= [0.0, 0.2, 0.2, 0.2, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
#         y= [0.0, 0.2, 0.2, 0.2, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
#         pad=10,  # 10 Pixels
#     ),
#     link = attr(
#         source= [0, 0, 0, 0, 3, 3, 4, 4, 4, 4],
#         target= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
#         value=  [70, 500, 250, 90, 150, 100, 30, 20, 20, 20]
#     ))
# )

# # § Figura 6.12: Gráfico de setores circular
# using PyCall
# using PyPlot
# pygui(true)
# pygui(:qt5)
# labels = ("B", "C", "D")
# sizes = [500, 250, 90]
# explode = (0.1, 0, 0)  # only "explode" the 1st slice
# fig1, ax1 = plt.subplots()
# ax1.pie(sizes, explode=explode, labels=labels, autopct="%1.1f%%",
#         shadow=true, startangle=90)
# ax1.axis("equal")  # Equal aspect ratio ensures that pie is drawn as a circle.
# plt.show()

# # § Figura 6.15: Integração de potências de aquecimento de água e obtenção de figura
# using Plots
# using NumericalIntegration
# t=collect(0:1:10)
# T_h=[30, 24, 34, 37, 36, 40, 41, 45, 52, 56, 52]
# dotm=3*3600 # Expresso em kg/h; 1 litro de água doce pesa 1 kg
# cp=4180/3.6e6 # Expresso em kWh/kg/ºC
# T_c=15
# dotE=dotm*cp*(T_h .-T_c) # Expresso em kWh/h = kW
# E=NumericalIntegration.integrate(t, dotE)
# E_t = NumericalIntegration.cumul_integrate(t, dotE)
# plotCumulE=Plots.plot(
#     t,E_t.-E_t[1], # subtração vetorial do primeiro valor do integral acumulado
#     seriestype = :scatter,
#     framestyle = :box,
#     markersize = 8,
#     legend=false,
#     xlabel="t [h]",
#     xguidefontsize=14,
#     xticks=0:2:10,
#     xtickfontsize=14,
#     ylabel="E [kWh]",
#     yguidefontsize=14,
#     yticks=0:400:3600,
#     ytickfontsize=14
# )

# # § Figura 6.16: Obtenção de reta de regressão e produção de figura
# using DataFrames, GLM
# mes=collect(1:1:12)
# prod=[8, 5, 1, 6, 4, 11, 9, 7, 2, 3, 12, 10]
# energ=[49, 45, 38, 42, 30, 59, 58, 46, 33, 31, 51, 43]
# data = DataFrame(y=energ, x=prod)
# model_est=lm(@formula(y ~ x), data)
# alpha, beta = coef(model_est)
# R2=r2(model_est)
# energ_est=predict(model_est, DataFrame(x = collect(0:1:12)))
# plotScatter=Plots.plot(
#     prod,energ,
#     seriestype = :scatter,
#     legend=false,
#     markersize = 8,
#     xlabel="Produção [unid]",
#     xguidefontsize=14,
#     xlims = (0,13),
#     xticks=0:1:13,
#     xtickfontsize=13,
#     ylabel="Consumo [tep]",
#     yguidefontsize=14,
#     ylims = (0,70),
#     yticks=0:10:70,
#     ytickfontsize=14
# )
# Plots.plot!(collect(0:1:12),energ_est, linewidth=4)

