import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors; // Java 8 and above

public class PlaylistColls {

    public static abstract class Item {
        public final float length_secs;

        public Item(float length_secs) {
            this.length_secs = length_secs;
        }
    }

    public static class Piece extends Item {
        public final String name;
        public final String performer;

        public Piece(String name, String performer, float length_secs) {
            super(length_secs);
            this.name = name;
            this.performer = performer;
        }

        @Override
        public String toString() {
            return String.format("%s by %s (%.1fs)", name, performer, length_secs);
        }
    }

    public static class Product {
        public final String name;
        public final String brand;

        public Product(String name, String brand) {
            this.name = name;
            this.brand = brand;
        }

        @Override
        public String toString() {
            return String.format("%s by %s", name, brand);
        }
    }

    public static class Advert extends Item {
        public final Product product;

        public Advert(Product product, float length_secs) {
            super(length_secs);
            this.product = product;
        }

        @Override
        public String toString() {
            return String.format("Advert for %s (%.1fs)", product.toString(), length_secs);
        }
    }

    public static void main(String[] args) {

        Piece piece1 = new Piece("Moonlight", "C. Arrau", 17 * 60 + 26f);
        Piece piece2 = new Piece("Pathetique", "D. Barenboim", 16 * 60 + 49f);
        Advert advert1 = new Advert(new Product("Bounty", "Mars"), 15.0f);

        List<Item> playlist1 = Arrays.asList(new Item[] { piece1, advert1, piece2 });
        System.out.printf("playlist1 = %s\n", playlist1);

        // use mapping to extract all lengths from playlist1:
        List<Float> lengths1 = new ArrayList<>();
        for (Item item : playlist1) {
            lengths1.add(item.length_secs);
        }

        System.out.printf("lengths1 = %s\n", lengths1);

        // an equivalent of the above, using Java 8 streams:
        List<Float> lengths1_streams = playlist1.stream()
                .map(e -> e.length_secs)
                .collect(Collectors.toList());

        System.out.printf("lengths1_streams = %s\n", lengths1_streams);

        // use filtering to remove adverts:
        List<Item> playlist1noAds = new ArrayList<>();
        for (Item item : playlist1) {
            if (!(item instanceof Advert)) {
                playlist1noAds.add(item);
            }
        }

        System.out.printf("playlist1noAds = %s\n", playlist1noAds);

        // an equivalent of the above, using Java 8 streams:
        List<Item> playlist1noAds_streams = playlist1.stream()
                .filter(e -> !(e instanceof Advert))
                .collect(Collectors.toList());

        System.out.printf("playlist1noAds_streams = %s\n", playlist1noAds_streams);

        List<Float> shortItemLengths1 = new ArrayList<>();
        // TASK 6.2(b)...






        System.out.printf("shortItemLengths1 = %s\n", shortItemLengths1);

        System.out.println();

        // Optional TASK:
        Map<Piece, Float> pieceToScoreA = new HashMap<>();
        pieceToScoreA.put(piece1, 10.0f);
        // pieceToScoreA.put(piece2, "dunno");
        System.out.format("pieceToScore = %s\n", pieceToScoreA);
        System.out.format("piece1's score = %s\n", pieceToScoreA.get(piece1));
    }
}
