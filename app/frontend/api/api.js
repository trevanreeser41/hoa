const BASE_URL = "http://localhost:3000";

export const fetchExampleData = async () => {
  const response = await fetch(`${BASE_URL}/example`);
  if (!response.ok) {
    throw new Error("Failed to fetch data");
  }
  return response.json();
};
