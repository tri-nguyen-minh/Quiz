
package utils;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 *
 * @author TNM
 */
public class Utilities{
    public static String encryptPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
        BigInteger number = new BigInteger(1,hash);
        StringBuilder hexString = new StringBuilder(number.toString(16));
        while(hexString.length()<32)
            hexString.insert(0, "0");
        return hexString.toString();
    }
}
