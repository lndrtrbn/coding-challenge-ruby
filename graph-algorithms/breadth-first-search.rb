=begin 
BREADTH FIRST SEARCH

BFS explores a graph from a starting vertex by going exploring all adjacent nodes
of a vertex. Then go to an other one, which is adjacent of the previous, exploring
all its non visited adjacent nodes again and continue until all the graph is discovered.

If some vertices are not reachable from the started vertex then they will not be
discovered by this BFS algorithm.

Applications of BFS algorithm :
- Find the Shortest path and Minimum spanning Tree for unweighted graph,
- Find if there is a path between two nodes of a graph,
- Find all connected nodes of a component,
- Detect cycle in undirected graphs,
- Discover neighbor of a peer-to-peer network,
- Find neighbors locations in GPS navigation,
- Broadcast in a network to reach all nodes
=end

######################
### ALGORITHM CODE ###
######################

# Class representing a directed graph using adjacency list
# representation. Where nodes are numbers from 0 to n.
class DirectedGraph
  def initialize
    # Initialize an empty graph
    @graph = Hash.new { |h, k| h[k] = [] }
  end

  # Add an edge in the graph from {departure} to {arrival}
  #
  # {departure} The start node of the edge
  # {arrival}   The end node of the edge
  def addEdge(departure, arrival)
    @graph[departure] << arrival
  end

  # Print the result of the BFS algorithm
  # And return shortest path length to every reachable nodes
  def BFS(departure)
    # Mark all nodes as not visited
    visited = Array.new @graph.length, false
    # The queue for the algorithm
    queue = Array.new

    # Mark the source node as visited and enqueue it
    queue << departure
    visited[departure] = 0

    step = 0
    while queue.length > 0
      step += 1
      # Dequeue a vertex from queue and print it
      departure = queue.shift
      print "#{departure} "

      # Get all adjacent vertices of the dequeued vertex s.
      # If a adjacent has not been visited, then mark it 
      # visited and enqueue it
      @graph[departure].each do |arrival|
        if visited[arrival] == false
          queue << arrival
          visited[arrival] = step
        end
      end
    end
    visited
  end
end

####################
### EXAMPLE CODE ###
####################

g = DirectedGraph.new
g.addEdge(0, 1) 
g.addEdge(0, 2) 
g.addEdge(1, 2) 
g.addEdge(2, 0) 
g.addEdge(2, 3) 
g.addEdge(3, 3) 

puts g.BFS(2).inspect