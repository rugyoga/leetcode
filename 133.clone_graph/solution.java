import java.util.*;

class Solution {
    public Node cloneGraph(Node node) {
        HashMap<Node, Node> cache = new HashMap<Node,Node>();
        return Solution.copy(node, cache);
    }

    static Node copy(Node node, Map<Node, Node> cache) {
        if (node == null) return null;
        if (cache.containsKey(node))
            return cache.get(node);
        else {
            Node clone = new Node();
            clone.val = node.val;
            clone.neighbors = new ArrayList<Node>();
            cache.put(node, clone);
            for (Node neighbor : node.neighbors) { 
                clone.neighbors.add(copy(neighbor, cache));
            }
            return clone;
        }
    }
}
