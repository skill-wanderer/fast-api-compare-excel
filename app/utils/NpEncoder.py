import json
import numpy as np

class NpEncoder(json.JSONEncoder):
        """
    Custom JSON encoder that handles NumPy data types.
    
    This encoder converts:
    - NumPy integers to Python integers
    - NumPy floats to Python floats (or None if NaN)
    - NumPy arrays to Python lists
    """
def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        elif isinstance(obj, np.floating):
            return float(obj) if not np.isnan(obj) else None
        elif isinstance(obj, np.ndarray):
            return obj.tolist()
        return super().default(obj)