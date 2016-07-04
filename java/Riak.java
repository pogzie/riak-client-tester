/*
1.) Make sure Java JDK is installed correctly. Test using `java -version`.
2.) Make sure that you know the location of the .jar file with dependencies.
3.) Compile the .java file with the -cp flag with the location of the .jar file.
  javac -cp /root/riak-java-client/riak-client-2.0.5-jar-with-dependencies.jar Riak.java
4.) Run the Java application accordingly.
  java -cp /root/riak-java-client/riak-client-2.0.5-jar-with-dependencies.jar:. Riak

TODO:
- Better exception handling.
- Maybe its good to read values of existing default bucket? it will not hit not found if
  there is an existing bucket with the same name as RiakTestBucket and the same key.
- DONE: Fix this to output 'Ok' if connection is successful to be standard as every other code

*/

import java.net.UnknownHostException;
import com.basho.riak.client.api.RiakClient;
import com.basho.riak.client.api.cap.UnresolvedConflictException;
import com.basho.riak.client.api.commands.kv.FetchValue;
import com.basho.riak.client.core.query.Location;
import com.basho.riak.client.core.query.Namespace;
import com.basho.riak.client.core.query.RiakObject;
import java.util.concurrent.ExecutionException;

public class Riak {
    public static void main(String [] args) throws UnknownHostException {

        try {
                // Riak Client with supplied IP and Port
                RiakClient client = RiakClient.newClient(8087, "localhost");

                System.out.println("Testing Riak connectivity.");

                Namespace ns = new Namespace("default","RiakTestBucket");
                Location loc = new Location(ns, "KeyOne");
                FetchValue fv = new FetchValue.Builder(loc).build();
                FetchValue.Response response = null;

                try {
                    response = client.execute(fv);
                } catch (ExecutionException | InterruptedException ex) {
                    //Logger.getLogger(RiakClusters.class.getName()).log(Level.SEVERE, null, ex);
                    System.out.println("Error!");
                }

                RiakObject obj = response.getValue(RiakObject.class);
                client.shutdown();

            } catch (UnresolvedConflictException ex) {
            //Logger.getLogger(RiakClusters.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error!");
        } // end of try-catch
        // If there are no exceptions, then i guess its safe to say that everything is good.
        System.out.println("Ok.");
    }
}
