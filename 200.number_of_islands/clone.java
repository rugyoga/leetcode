import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    static class Node {
        public int val;
        public List<Node> neighbors;
    }

    static Node copy(Node n, Map<Node, Node> cache) {
        if (n == null) return null;
        if (cache.containsKey(n))
            return cache.get(n);
        else {
            Node clone = new Node();
            clone.val = n.val;
            clone.neighbors = new ArrayList<Node>();
            cache.put(n, clone);
            for (Node node : n.neighbors) { 
                clone.neighbors.add(copy(node, cache));
            }
            return clone;
        }
    }
    
    static Node copy(Node n) {
        HashMap<Node, Node> cache = new HashMap<Node,Node>();
        return Solution.copy(n, cache);
    }

    public static void main(String args[] ) throws Exception {
        Node n = new Node();
        n.val = 5;
        n.neighbors = new ArrayList<Node>();
        n.neighbors.add(null);
        n.neighbors.add(n);
        Node clone = copy(n);
    }
}
// Your old code in elixir has been preserved below.
// # Given a reference of a node in a connected undirected graph.

// # Return a deep copy (clone) of the graph.

// # Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.





// defmodule Solution do
//   defp sum(a, b), do: a + b

//   def main() do
//     a = IO.gets("") |> String.trim |> String.to_integer
//     b = IO.gets("") |> String.trim |> String.to_integer
//     sum(a, b) |> IO.puts
//   end
// end

// Solution.main()

