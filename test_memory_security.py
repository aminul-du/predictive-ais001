from fastapi.testclient import TestClient
from predictive_memory_guard import PredictiveMemorySecurityFramework
from remediation_receiver import app, buffer_manager

def test_entropy_and_flush():
    assert PredictiveMemorySecurityFramework.calculate_shannon_entropy("বাংলা ভাষা") < 4.65
    client = TestClient(app)
    res = client.post("/api/v1/remediate/memory-isolate", json={"event": "ALERT", "action": "ISOLATE_AGENT_CONTEXT_BUFFER", "report": {"id": "1"}})
    assert res.status_code == 200
    assert res.json()["telemetry"]["after_mb"] == 0.0
