/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.copy.model.objecttype.bericht.basis;

import javax.validation.Valid;

import nl.bzk.copy.model.basis.AbstractObjectTypeBericht;
import nl.bzk.copy.model.groep.bericht.BetrokkenheidOuderlijkGezagGroepBericht;
import nl.bzk.copy.model.groep.bericht.BetrokkenheidOuderschapGroepBericht;
import nl.bzk.copy.model.objecttype.bericht.PersoonBericht;
import nl.bzk.copy.model.objecttype.bericht.RelatieBericht;
import nl.bzk.copy.model.objecttype.logisch.basis.BetrokkenheidBasis;
import nl.bzk.copy.model.objecttype.operationeel.statisch.SoortBetrokkenheid;
import nl.bzk.copy.model.validatie.MeldingCode;
import nl.bzk.copy.model.validatie.constraint.ConditioneelVerplichtVeld;
import nl.bzk.copy.model.validatie.constraint.ConditioneelVerplichteVelden;

/**
 * Implementatie voor objecttype betrokkenheid.
 */
@SuppressWarnings("serial")
@ConditioneelVerplichteVelden({
                                      @ConditioneelVerplichtVeld(
                                              naamVerplichtVeld = "betrokkenheidOuderschap.datumAanvang",
                                              naamAfhankelijkVeld = "rol.code", waardeAfhankelijkVeld = "K",
                                              verplichtNull = true, code = MeldingCode.BRAL0203, message = "BRAL0203")
                              })
public abstract class AbstractBetrokkenheidBericht extends AbstractObjectTypeBericht implements BetrokkenheidBasis {

    private SoortBetrokkenheid rol;
    private RelatieBericht relatie;
    @Valid
    private PersoonBericht betrokkene;
    private BetrokkenheidOuderlijkGezagGroepBericht betrokkenheidOuderlijkGezag;
    @Valid
    private BetrokkenheidOuderschapGroepBericht betrokkenheidOuderschap;

    @Override
    public SoortBetrokkenheid getRol() {
        return rol;
    }

    @Override
    public RelatieBericht getRelatie() {
        return relatie;
    }

    @Override
    public PersoonBericht getBetrokkene() {
        return betrokkene;
    }

    @Override
    public BetrokkenheidOuderlijkGezagGroepBericht getBetrokkenheidOuderlijkGezag() {
        return betrokkenheidOuderlijkGezag;
    }

    @Override
    public BetrokkenheidOuderschapGroepBericht getBetrokkenheidOuderschap() {
        return betrokkenheidOuderschap;
    }

    public void setRol(final SoortBetrokkenheid rol) {
        this.rol = rol;
    }

    public void setRelatie(final RelatieBericht relatie) {
        this.relatie = relatie;
    }

    public void setBetrokkene(final PersoonBericht betrokkene) {
        this.betrokkene = betrokkene;
    }

    public void setBetrokkenheidOuderlijkGezag(final BetrokkenheidOuderlijkGezagGroepBericht betrokkenheidOuderlijkGezag) {
        this.betrokkenheidOuderlijkGezag = betrokkenheidOuderlijkGezag;
    }

    public void setBetrokkenheidOuderschap(final BetrokkenheidOuderschapGroepBericht betrokkenheidOuderschap) {
        this.betrokkenheidOuderschap = betrokkenheidOuderschap;
    }
}
