select 
 '' as 'PRAZO/PROPRIO', -- Verificar com Raoni
 Inv.Inv_Nome as 'Origem',
 Car_Placa as 'Placa',
 Car_Modelo as 'Veículo',
 SUBSTRING( Car_Ano, 6, 4) as 'Ano',
 cast(29990 as float) as 'Fipe Anterior', --- Vai trazer do sistema atual
 Car_FIPE as 'Fipe Atual',
 Car_FIPE - 29990 as 'Indice Fipe',
 coalesce(Car_VLVenda - Car_FIPE,0) as 'FIPE-PV',
 coalesce(Car_VLVenda,0) as 'PV',
 coalesce(Car_VLBase + Car_Custos,0) as 'PC',
 coalesce(DATEDIFF(day, Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0) as 'Tempo Estoque',
 coalesce(DATEDIFF(day, Car_DtPatio ,   case when Car_DtVenda is not null then Car_DtVenda else getdate() end) ,0)   as 'Tempo Loja',
 coalesce(Car_VLVenda - coalesce(Car_VLBase + Car_Custos,0) ,0) as 'Margem',
 coalesce(Car_VLVenda - (Car_VLBase + Car_Custos),0) /
 case when DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) = 0 then 1 else
           DATEDIFF(day,Car_DtEntrada , case when Car_DtVenda is not null then Car_DtVenda else getdate() end) end as 'Margem/Dia',
 SUBSTRING( car_codfipe, 1, 8 ) as Cod_Fipe,
 Car_Sit as 'Situação'
 from CadCar
 left join Inv on Inv_Cod = Car_Inv
 where
 Car_DtEntrada is not null and Car_VLVenda > 0
 and Car_VLVenda - (Car_VLBase + Car_Custos) is not null
 and Car_DtEntrada >= '01/11/2021' and Car_DtEntrada<= '27/11/2021' and Car_Loja = '3-GRA'
order by Car_Cod desc
