## Abstract
<!-- Context      -->
The World Wide Web of Linked Data (WWWLD) can be represented as one big decentralized unstructured database.
<!-- Need         -->
Querying this database is difficult due to the pseudo-infinite size of the web and
its unstructured nature providing little standardize useful a priori information
for query optimization.
<!-- Task         -->
Most queries over the web implicitly target a small unknown subdomain.
If the data providers expose some information about the data they publish
it is possible to progressively know information about segments of the search domain
before traversing it.
<!-- Object       -->
We propose to introduce a shape index as a means to describe
data sources improving the discoverability and quality of data, and helping query engine in their processing.
<!-- Findings     -->
With our early experiment, we show that our method can more easily
discover data on the web and greatly reduce the query execution time compared to the current state of the art
by adapting dynamically the query engine lookup policy .
<!-- Conclusion   -->
Those results indicate that if the data publisher describes precisely the content and location of its data
and if the user creates selective enough queries then queries over the WWWLD might be a viable means to access information 
on the web without predefined federation.
<!-- Perspectives -->
In future work we are going to formalize our method, evaluate it with more queries, and environment and experiment if we can improve query plan and the speed the users get their results.