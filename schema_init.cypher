CREATE CONSTRAINT req_id IF NOT EXISTS FOR (r:Requirement) REQUIRE r.id IS UNIQUE;
CREATE CONSTRAINT comp_id IF NOT EXISTS FOR (c:SystemComponent) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT find_id IF NOT EXISTS FOR (f:Finding) REQUIRE f.id IS UNIQUE;
MERGE (c1:SystemComponent {id: "COMP-PYTORCH-MEM", name: "PyTorch Vector Memory", layer: "Runtime_Memory"})
MERGE (c2:SystemComponent {id: "COMP-SHORBORNO-RAG", name: "ShorbornoAI Bengali Engine", layer: "Application"})
MERGE (r1:Requirement {id: "REQ-SEC-MEM-01", title: "Prevent Context Overflow & Adversarial Injection", criticality: "HIGH"})
MERGE (c1)-[:SUPPORTS]->(c2)
MERGE (c1)-[:IMPLEMENTS]->(r1);
