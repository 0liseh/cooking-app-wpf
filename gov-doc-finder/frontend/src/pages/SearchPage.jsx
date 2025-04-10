import React, { useState } from "react";
import SearchBar from "../elements/SearchBar";
import { searchDocuments } from "../scripts/SearchService";

function SearchPage() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState([]);

  const handleSearch = async () => {
    const data = await searchDocuments(query);
    setResults(data.results);
  };

  return (
    <div>
      <h1>Government Document Finder</h1>
      <SearchBar query={query} setQuery={setQuery} onSearch={handleSearch} />
      <p>{results}</p>
    </div>
  );
}

export default SearchPage;