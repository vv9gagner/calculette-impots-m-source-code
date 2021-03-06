#*************************************************************************************************************************
#
#Copyright or � or Copr.[DGFIP][2017]
#
#Ce logiciel a �t� initialement d�velopp� par la Direction G�n�rale des 
#Finances Publiques pour permettre le calcul de l'imp�t sur le revenu 2012 
#au titre des revenus percus en 2011. La pr�sente version a permis la 
#g�n�ration du moteur de calcul des cha�nes de taxation des r�les d'imp�t 
#sur le revenu de ce mill�sime.
#
#Ce logiciel est r�gi par la licence CeCILL 2.1 soumise au droit fran�ais 
#et respectant les principes de diffusion des logiciels libres. Vous pouvez 
#utiliser, modifier et/ou redistribuer ce programme sous les conditions de 
#la licence CeCILL 2.1 telle que diffus�e par le CEA, le CNRS et l'INRIA  sur 
#le site "http://www.cecill.info".
#
#Le fait que vous puissiez acc�der � cet en-t�te signifie que vous avez pris 
#connaissance de la licence CeCILL 2.1 et que vous en avez accept� les termes.
#
#**************************************************************************************************************************
verif 7310:
application : pro , oceans , iliad , batch  ;
si
	  ( present(CMAJ)=1 et present(MOISAN)=0 )
	  ou
	  ( present(CMAJ2)=1 et present(MOISAN2)=0 )
          
alors erreur A96201;
verif 7311:
application : pro , oceans , iliad , batch  ;
si
	  (  present(CMAJ)=0 et present(MOISAN)=1)
	  ou
	  (  present(CMAJ2)=0 et present(MOISAN2)=1)
          
alors erreur A96202;
verif isf 73101:
application : pro , oceans , iliad , batch  ;
si
	  ( present(CMAJ_ISF)=1 et present(MOISAN_ISF)=0 )
          
alors erreur A96203;
verif isf 73111:
application : pro , oceans , iliad , batch  ;
si
	  (  present(CMAJ_ISF)=0 et present(MOISAN_ISF)=1)
          
alors erreur A96204;
verif 7314:
application : oceans , iliad , batch ;
si
	( 
	CMAJ != 7 et ( APPLI_BATCH  = 1
                    ou APPLI_OCEANS = 1
                    ou (APPLI_ILIAD = 1 et
                          non ( V_CALCULIR+0=1
                               ou (V_NOTRAIT+0) dans (16,23,26,33,36,43,46,53,56)
                              )
                        )
	             )
	)
	ou
	( 
	CMAJ2 != 7 et CMAJ2 != 0 et ( APPLI_BATCH  = 1
                    ou APPLI_OCEANS = 1
                    ou (APPLI_ILIAD = 1 et
                          non ( V_CALCULIR+0=1
                               ou (V_NOTRAIT+0) dans (16,23,26,33,36,43,46,53,56)
                              )
                        )
	             )
	)
alors erreur A96101;
verif 73141:
application : pro , oceans , iliad ;
si
       (
       CMAJ non dans ( 7..8 ) et CMAJ non dans (10..11) et CMAJ non dans (17..18)  
     et (  (APPLI_ILIAD=1 et
                   ( V_CALCULIR+0=1 ou (V_NOTRAIT+0) dans (16,23,26,33,36,43,46,53,56))
           )
           ou APPLI_PRO  =1)
       )
       ou
       (
       CMAJ2 non dans ( 7..8 ) et CMAJ2 non dans (10..11) et CMAJ2 non dans (17..18) et CMAJ2 != 0
     et (  (APPLI_ILIAD=1 et
                   ( V_CALCULIR+0=1 ou (V_NOTRAIT+0) dans (16,23,26,33,36,43,46,53,56))
           )
           ou APPLI_PRO  =1)
       )
alors erreur A96103;
verif isf 731412:
application : pro , iliad ;
si
       (
       CMAJ_ISF non dans ( 7..8 ) et CMAJ_ISF non dans ( 17..18 ) 
        et (  (APPLI_ILIAD=1 et
                   ( V_CALCULIR+0=1 ou (V_NOTRAIT+0) dans (16,23,26,33,36,43,46,53,56))
              )
             ou APPLI_PRO  =1
	   )
       )
alors erreur A96104;
verif isf 73143:
application : iliad , batch ;
si
	( 
	(ISFBASE >= 0) 
		et
		(CMAJ != 0
			et ( APPLI_BATCH  = 1
                        ou (APPLI_ILIAD = 1 et
                             non ( V_CALCULIR+0=1
                                 ou (V_NOTRAIT+0) dans (16,23,26,33,36,43,46,53,56)
                                 )
                           ))
	           )
	)
alors erreur A96102;

verif 73641:
application : pro , oceans , iliad , batch  ;
si
	(
       ((inf( DATDEPETR/1000000 ) non dans (01..31)) et V_IND_TRAIT+0 = 4)
ou
       ((inf( DATDEPETR/1000000 ) non dans (01..31)) et V_IND_TRAIT = 5 et DATDEPETR != 0)
	) 
alors erreur A96401;
verif 73642:
application : pro , oceans , iliad , batch  ;
si
	(
       ((inf( (DATDEPETR/1000000 - inf(DATDEPETR/1000000))*100 ) non dans (01..12)) et (V_IND_TRAIT+0= 4))
ou
       ((inf( (DATDEPETR/1000000 - inf(DATDEPETR/1000000))*100 ) non dans (01..12)) 
		et V_IND_TRAIT = 5 et DATDEPETR != 0)
	) 
alors erreur A96402;
verif 736431:
application : pro, oceans , iliad , batch ;
si (
 ((arr( (DATDEPETR/10000 - inf(DATDEPETR/10000))*10000 ) != V_ANREV) et V_IND_TRAIT+0 = 4)
ou
 ((arr( (DATDEPETR/10000 - inf(DATDEPETR/10000))*10000 ) != V_ANREV) 
		et V_IND_TRAIT = 5 et DATDEPETR != 0)
   ) 
alors erreur A96403;
verif 73651:
application : pro , oceans , iliad , batch  ;
si
	(
       ((inf( DATRETETR/1000000) non dans (01..31)) et V_IND_TRAIT+0 = 4)
	ou
       ((inf( DATRETETR/1000000) non dans (01..31)) et V_IND_TRAIT = 5 et DATRETETR != 0)
	) 
alors erreur A96501;
verif 73652:
application : pro , oceans , iliad , batch  ;
si
	(
       ((inf( (DATRETETR/1000000 - inf(DATRETETR/1000000))*100 ) non dans (01..12)) et V_IND_TRAIT+0 = 4)
	ou
       ((inf( (DATRETETR/1000000 - inf(DATRETETR/1000000))*100 ) non dans (01..12)) 
	et V_IND_TRAIT = 5 et DATRETETR != 0)
	) 
alors erreur A96502;
verif 736531:
application : pro, oceans , iliad , batch ;
si (
 ((arr( (DATRETETR/10000 - inf(DATRETETR/10000))*10000 ) != V_ANREV) et V_IND_TRAIT+0 = 4)
ou
 ((arr( (DATRETETR/10000 - inf(DATRETETR/10000))*10000 ) != V_ANREV) 
            et V_IND_TRAIT = 5 et DATRETETR != 0)
   ) 
alors erreur A96503;
verif 7366:
application : pro , oceans , iliad , batch  ;
si
	(
       DATDEPETR > 0 et DATRETETR > 0
	) 
alors erreur A966;
verif 7315:
application : pro , oceans , iliad , batch  ;
si
        (V_IND_TRAIT > 0 )
       et
	(
	inf(MOISAN/10000) non dans (01..12)
	ou
	inf(MOISAN2/10000) non dans (00..12)
	) 
alors erreur A96301;
verif 7316:
application : oceans , iliad , batch ;
si 
   (
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+1
et
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+2
et
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+3
et
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+4
   ) 
   ou
   (
 arr( (MOISAN2/10000 - inf(MOISAN2/10000))*10000 ) != V_ANREV+1
et
 arr( (MOISAN2/10000 - inf(MOISAN2/10000))*10000 ) != V_ANREV+2
et
 arr( (MOISAN2/10000 - inf(MOISAN2/10000))*10000 ) != V_ANREV+3
et
 arr( (MOISAN2/10000 - inf(MOISAN2/10000))*10000 ) != V_ANREV+4
et
 arr( (MOISAN2/10000 - inf(MOISAN2/10000))*10000 ) != 0
   ) 
alors erreur A96302;
verif isf 73151:
application : pro , oceans , iliad , batch  ;
si
        (V_NOTRAIT + 0 < 20 )
       et
	(
	inf(MOISAN_ISF/10000) non dans (01..12)
	) 
alors erreur A96303;
verif isf 73161:
application : iliad , batch ;
si 
   (
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+1
et
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+2
et
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+3
et
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+4
   ) 

alors erreur A96304;
verif 7317:
application : pro ;
si (
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+1
et
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+2
et
 arr( (MOISAN/10000 - inf(MOISAN/10000))*10000 ) != V_ANREV+3
   ) 
alors erreur A96302;
verif isf 73171:
application : pro ;
si (
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+1
et
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+2
et
 arr( (MOISAN_ISF/10000 - inf(MOISAN_ISF/10000))*10000 ) != V_ANREV+3
   )
alors erreur A96304 ;
verif 7332:
application : pro , oceans , iliad , batch ;
si
  (
  V_IND_TRAIT > 0
  et
  LOYIMP > 99999
  )
alors erreur A00106 ;
verif 7441:
application :  iliad ;

si 
   (
   positif ( ANNUL2042 ) + INDAUTREQUE9YA > 1
   )
alors erreur A99301;
verif 600:
application :  iliad, batch, pro ;

si 
   positif(PERPIMPATRIE+0) != 1 et
   V_REGCO+0 != 2 et V_REGCO+0 != 4 et V_CNR+0 != 1 et
   (
   (positif(PERP_COTV+0) > 0 et 
    present(PERPPLAFCV)*present(PERPPLAFNUV1)*present(PERPPLAFNUV2)*present(PERPPLAFNUV3) = 0)
    ou
   (positif(PERP_COTC+0) > 0 et 
    present(PERPPLAFCC)*present(PERPPLAFNUC1)*present(PERPPLAFNUC2)*present(PERPPLAFNUC3) = 0)
    ou
   (positif(PERP_COTP+0) > 0 et 
    present(PERPPLAFCP)*present(PERPPLAFNUP1)*present(PERPPLAFNUP2)*present(PERPPLAFNUP3) = 0)
   )
alors erreur A600;
verif 601:
application :  iliad, batch, pro ;

si (V_IND_TRAIT > 0) et positif(PERPIMPATRIE+0) != 1 
   et
   (
   PERPPLAFCV > LIM_PERPMAXBT ou PERPPLAFCC > LIM_PERPMAXBT
   )
alors erreur A601;
verif 602:
application :  iliad, batch, pro ;

si 
   (
    (positif(RACCOTV+0) > 0 et positif(PERP_COTV+0) = 0)
    ou
    (positif(RACCOTC+0) > 0 et positif(PERP_COTC+0) = 0)
    ou
    (positif(RACCOTP+0) > 0 et positif(PERP_COTP+0) = 0)
   )
alors erreur A602;
verif 603:
application :  iliad, batch ;

si
   positif(PERPIMPATRIE+0) != 1 et positif(V_CALCULIR+0)=0
   et
  (
  (positif(PLAF_PERPV+0) = 1 et  
	    (present(PERPPLAFCV) = 0 et present(PERPPLAFNUV1) = 0
	     et present(PERPPLAFNUV2) = 0 et present(PERPPLAFNUV3) = 0 ))
  ou
  (positif(PLAF_PERPC+0) = 1 et  
	    (present(PERPPLAFCC) = 0 et present(PERPPLAFNUC1) = 0
	     et present(PERPPLAFNUC2) = 0 et present(PERPPLAFNUC3) = 0 ))
  ou
  (positif(PLAF_PERPP+0) = 1 et  
	    (present(PERPPLAFCP) = 0 et present(PERPPLAFNUP1) = 0
	     et present(PERPPLAFNUP2) = 0 et present(PERPPLAFNUP3) = 0 ))
  ou
  (positif(PLAF_PERPV+0) = 1 
		 et (PERPPLAFCV+PERPPLAFNUV1+PERPPLAFNUV2+PERPPLAFNUV3 = 
		      V_BTPERPV+V_BTPERPNUV1+V_BTPERPNUV2+V_BTPERPNUV3) )
  ou
  (positif(PLAF_PERPC+0) = 1 
		 et (PERPPLAFCC+PERPPLAFNUC1+PERPPLAFNUC2+PERPPLAFNUC3 = 
		      V_BTPERPC+V_BTPERPNUC1+V_BTPERPNUC2+V_BTPERPNUC3) )
  ou
  (positif(PLAF_PERPP+0) = 1 
		 et (PERPPLAFCP+PERPPLAFNUP1+PERPPLAFNUP2+PERPPLAFNUP3 = 
		      V_BTPERPP+V_BTPERPNUP1+V_BTPERPNUP2+V_BTPERPNUP3) )
  )
alors erreur A603;
verif 604:
application :  iliad, batch, pro ;

si positif(PERPMUTU) = 1 et (V_0AM + V_0AO = 1) et ((V_REGCO+0) dans (1,3,5,6))
	et positif(PERPIMPATRIE+0) = 0
	et (present(PERPPLAFCV) = 0 ou present(PERPPLAFNUV1) = 0
	ou present(PERPPLAFNUV2) = 0 ou present(PERPPLAFNUV3) = 0
	ou present(PERPPLAFCC) = 0 ou present(PERPPLAFNUC1) = 0
	ou present(PERPPLAFNUC2) = 0 ou present(PERPPLAFNUC3) =0)

alors erreur A604;
verif 6051:
application :  iliad, batch, pro ;

si

   V_IND_TRAIT > 0
   et
   PERPV + 0 < EXOCETV + 0
   et 
   positif(EXOCETV + 0) = 1

alors erreur A60501 ;
verif 6052:
application :  iliad, batch, pro ;

si

   V_IND_TRAIT > 0
   et
   PERPC + 0 < EXOCETC + 0
   et
   positif(EXOCETC + 0) = 1

alors erreur A60502 ;
