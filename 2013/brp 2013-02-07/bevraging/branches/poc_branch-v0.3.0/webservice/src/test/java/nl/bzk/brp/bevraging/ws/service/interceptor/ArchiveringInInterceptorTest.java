/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.bevraging.ws.service.interceptor;

import static org.junit.Assert.assertSame;

import java.util.logging.Logger;

import org.junit.Test;


/**
 * Unit test voor de {@link ArchiveringInInterceptor} class.
 */
public class ArchiveringInInterceptorTest {

    @Test(expected = IllegalArgumentException.class)
    public void testConstructorMetLegeLogger() {
        new ArchiveringInInterceptor(null);
    }

    @Test
    public void testCorrecteConstructorEnLoggerMethode() {
        Logger logger = Logger.getLogger("Test");

        ArchiveringInInterceptor interceptor = new ArchiveringInInterceptor(logger);
        assertSame(logger, interceptor.getLogger());
    }
}
