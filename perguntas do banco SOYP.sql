-- 1. Quais pragas apresentam a fase "larva"?

select nomeComum, nomeCientifico, nomefase
		from Praga p 
        inner join PragaFase pf
        on p.idPraga=pf.idPraga
        inner join Fase f
		on f.idFase=pf.idFase
        where f.nomeFase like 'Larva%';
        
-- 2. Quantas pragas estão registradas em cada fase?

select nomeFase, count(*) as NumeroPragas
		from Praga p 
        inner join PragaFase pf
        on p.idPraga=pf.idPraga
        inner join Fase f
		on f.idFase=pf.idFase 
        group by nomeFase;
        
-- 3. Quais pragas na fase larval apresentam coloração verde?

select nomeComum, nomeFase, coloracao
		from Fase f
        inner join PragaFase pf
        on f.idFase=pf.idFase
        inner join Praga p 
        on p.idPraga=pf.idPraga 
        inner join Formato fo
        on p.idPraga=fo.idPraga 
		where fo.coloracao like '%erd%' and f.nomeFase like '%arva%';

-- 4. Exiba o nome e a fase das pragas que atacam o caule.

select nomeComum, nomeFase, localAtaque 
		from Fase f
        inner join PragaFase pf
        on f.idFase=pf.idFase
        inner join Praga p 
        on p.idPraga=pf.idPraga 
        inner join Formato fo
        on p.idPraga=fo.idPraga   
        where fo.localAtaque like '%aul%';
        
-- 5. Quais pragas possuem o formato besouro e possuem tamanho menor que 50mm?
select nomeComum, formato, tamanho
		from Praga p
        inner join Formato fo
        on p.idPraga=fo.idPraga
        where fo.formato like '%ouro%' and fo.tamanho <50;

-- 6. Apresente os nomes científicos das pragas que atacam as folhas, independente da fase.

select nomeCientifico,nomeComum, localAtaque
		from Praga p
        inner join Formato fo
        on p.idPraga=fo.idPraga
        where fo.localAtaque like '%olha%';
        
-- 7. Quais pragas na fase adulta atacam as raízes e são menores que 100 mm ?

select nomeComum, nomeFase, localAtaque, tamanho
		from Fase f 
        inner join PragaFase pf
        on f.idFase=pf.idFase
        inner join Praga p
        on p.idPraga=pf.idPraga
        inner join Formato fo
        on p.idPraga=fo.idPraga
        where f.nomeFase like '%dult%' and fo.localAtaque like '%aíz%' and fo.tamanho<100;
        
-- 8. Qual a fase e o período de incidência do Coró da soja?

select nomeComum, nomeFase, inicioIncidencia, fimIncidencia
		from Fase f 
        inner join PragaFase pf
        on f.idFase=pf.idFase
        inner join Praga p
        on p.idPraga=pf.idPraga
        where p.nomeComum like '%oró%';
        
-- 9. Quantas fotos de Cupim o usuário Cauã tirou?

select nome, count(idImagem) as QuantFotosTiradas, formato as FormatoPraga
		from Usuario u
        inner join Imagem i
        on u.idUsuario = i.idUsuario
        inner join Formato fo
        on i.idFormato = fo.idFormato
        where u.nome like '%Cauã%' and fo.formato like '%upim%'
        group by u.nome, fo.formato;
        
-- 10. Quais usuarios tiraram fotos no mesmo ano de 2018 e de quais pragas?

select nome, idImagem, dataT, nomeComum
	from Usuario u
    inner join Imagem i
	on u.idUsuario = i.idUsuario
    inner join Formato fo
    on i.idFormato=fo.idFormato
    inner join Praga p
    on p.idPraga=fo.idPraga
    where year(i.dataT)=2018
    order by u.nome ;
    
-- 11. Quais fases foram fotografadas no mes de dezembro?

select idImagem, nomeFase, dataT 
	from Fase f
    inner join Formato fo
    on f.idFase=fo.idFase
    inner join imagem i
    on i.idFormato=fo.idFormato
    where month(i.dataT)=12;
    
    
-- 12. Relacione os usuários, as pragas e fases que eles fotografaram, com o local, data e horario da foto.

select nome as Usuario, nomeComum as Praga, nomeFase as Fase, idImagem as CodigoFoto, dataT, hora, latitude, longitude
		from Usuario u
        inner join Imagem i
        on u.idUsuario=i.idUsuario
        inner join Formato fo
        on i.idFormato=fo.idFormato
        inner join Praga p
        on fo.idPraga=p.idPraga
        inner join PragaFase pf
        on pf.idPraga=p.idPraga
        inner join Fase f
        on f.idFase = pf.idFase;
        
-- 13. Quantas fotos de pragas verdes foram registradas?

select coloracao, count(idImagem)
		from imagem i 
		inner join formato fo 
		on i.idFormato=fo.idFormato
		where fo.coloracao like '%erde%'
		group by fo.coloracao;

-- 14. Quais pragas foram identificadas antes do meio dia?

select idImagem as CodigoFoto, nome as Usuario, nomeComum as Praga, hora
		from Usuario u
        inner join Imagem i
        on i.idUsuario=u.idUsuario
        inner join Formato fo
        on i.idFormato=fo.idFormato
        inner join Praga p 
        on fo.idPraga = p.idPraga
        where hour(hora)<12;
        
-- 15. Exiba as localizações das pragas que atacam as hastes.

select nomeComum, longitude, latitude, localAtaque
	from Praga p
    inner join Formato fo
    on p.idPraga=fo.idPraga
    inner join Imagem i
	on fo.idFormato=i.idFormato
    where fo.localAtaque like '%aste%';
    
-- 16. Exiba as localizações onde foram encontradas lagartas verdes. 

select idImagem as codigoFoto, nomeComum as Praga, latitude, longitude
		from Imagem i
        inner join Formato fo
        on i.idFormato = fo.idFormato
        inner join Praga p
        on p.idPraga = fo.idPraga
        where p.nomeComum like '%agarta%' and fo.coloracao like '%erd%';
        
-- 17. Quais pragas foram encontradas entre as longitudes 50 e 100?

select nomeComum as Praga, longitude, latitude
		from Praga p
        inner join Formato fo
        on p.idPraga = fo.idPraga
        inner join Imagem i
        on fo.idFormato= i.idFormato
        where longitude between 50 and 100 ;
        
-- 18. Quais usuários fotografaram pragas no dia 24 de outubro?

select distinct nome, nomeComum, dataT, tamanho
		from praga p 
		inner join formato fo
		on p.idPraga=fo.idPraga
		inner join imagem i
		on fo.idFormato=i.idFormato
		inner join usuario u
		on i.idUsuario=u.idUsuario
		where month(i.dataT)=10 and day(i.dataT)=24;
        
-- 19. Quais pragas que atacam vagens foram fotografadas?

select nomeComum, localAtaque
		from Praga p
		inner join Formato fo
		on p.idPraga = fo.idPraga
		where fo.localAtaque like '%age%';

-- 20. Exiba os usuários em ordem alfabética e o ciclo de vida das pragas que ele fotografou
select nome as Usuario, nomeComum as Praga, cicloVida
		from Usuario u
        inner join Imagem i
        on u.idUsuario = i.idUsuario
        inner join Formato fo
        on i.idFormato = fo.idFormato
        inner join Praga p
        on fo.idPraga = p.idPraga
        order by nome;
        