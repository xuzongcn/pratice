*************************mediation (wave2)***************************************************

regress get_corona nei1 avoid_corona hungry hhinc_pc govt_grant Decreased_inc Traditional_chiefdom Township Formal_residential Farm Small_holding age age2 male African withpartner House_flat Trad_hut Informal_shack Employed sch_yrs sch_yrs2 num_pre_beh reproduction_rate
outreg2 using "$OUT\mediate.doc",  replace dec(2) stats(coef se)

medeff (regress get_corona nei1 avoid_corona hungry hhinc_pc  govt_grant Decreased_inc Traditional_chiefdom Township Formal_residential Farm Small_holding age age2 male African withpartner House_flat Trad_hut Informal_shack Employed sch_yrs sch_yrs2 num_pre_beh reproduction_rate) (regress depression nei1 get_corona avoid_corona hungry hhinc_pc govt_grant Decreased_inc Traditional_chiefdom Township Formal_residential Farm Small_holding age age2 male African withpartner House_flat Trad_hut Informal_shack Employed sch_yrs sch_yrs2 num_pre_beh reproduction_rate) , treat(nei1) mediate(get_corona) sims(100) seed(1)


*************************mediation (wave5)***************************************************
regress get_corona nei1 avoid_corona hungry govt_grant Decreased_inc Traditional_chiefdom Township Formal_residential Farm Small_holding age age2 male African withpartner House_flat Trad_hut Informal_shack Employed sch_yrs sch_yrs2 num_pre_beh reproduction_rate
outreg2 using "$OUT\mediate.doc",  append dec(2) stats(coef se)

medeff (regress get_corona nei1 avoid_corona hungry govt_grant Decreased_inc Traditional_chiefdom Township Formal_residential Farm Small_holding age age2 male African withpartner House_flat Trad_hut Informal_shack Employed sch_yrs sch_yrs2 num_pre_beh reproduction_rate) (regress depression nei1 get_corona avoid_corona hungry govt_grant Decreased_inc Traditional_chiefdom Township Formal_residential Farm Small_holding age age2 male African withpartner House_flat Trad_hut Informal_shack Employed sch_yrs sch_yrs2 num_pre_beh reproduction_rate) , treat(nei1) mediate(get_corona) sims(100) seed(1)
outreg2 using "$OUT\mediate.doc",  append dec(2) stats(coef se)
