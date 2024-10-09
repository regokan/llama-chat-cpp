Here is the updated `README` to include the setup instructions using `make`:

# Membot

## Overview

Membot is a chatbot project built with C++ that utilizes smart pointers for efficient memory management. The bot navigates through a graph of nodes and edges to generate responses based on user input. The main goal is to demonstrate memory management techniques such as ownership transfer using modern C++ features, including move semantics and smart pointers (`std::unique_ptr`).

### Core Features:

- **GraphNode**: Represents a node in the graph, holds child and parent edges, and owns a chatbot instance.
- **GraphEdge**: Represents the connection between two graph nodes.
- **ChatBot**: The main chatbot that moves between nodes and processes user messages.

## Installation

### Dependencies:

- **wxWidgets**: GUI library used to render the bot interface.
- **CMake**: Build system generator.
- **g++ or clang++**: C++ compiler.

### Installation Instructions Using `make`

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/membot.git
   cd membot
   ```

2. **Install dependencies** using the `setup` target:

   - For Linux (Debian-based):
     ```bash
     make setup-debian
     ```
   - For macOS:
     ```bash
     make setup-mac
     ```

3. **Build the project**:

   ```bash
   make build
   cd build
   ```

4. **Run the Membot**:

   ```bash
   ./build/membot
   ```

5. **Format the code** (optional):

   ```bash
   make format
   ```

6. **Build with debugging symbols** (optional):

   ```bash
   make debug
   ```

7. **Clean up build artifacts**:
   ```bash
   make clean
   ```

Here is the updated **High-Level Structure** section with the `ChatLogic` class added:

## High-Level Structure

The project consists of the following core classes and namespaces:

- **`ChatLogic`**:

  - Manages the flow of information between the chatbot and the graphical user interface.
  - Handles loading the answer graph and passing messages between the user asnd the chatbot.
  - Responsible for setting up the interaction between nodes, edges, and the chatbot.

- **`GraphNode`**:

  - Represents a node in the chatbot’s decision tree.
  - Holds edges to child and parent nodes.
  - Manages the chatbot’s movement between nodes and stores possible responses.

- **`GraphEdge`**:

  - Represents the connection between two graph nodes, pointing from a parent node to a child node.
  - Holds keywords associated with this connection.

- **`ChatBot`**:
  - The main chatbot class that interacts with users.
  - Moves between nodes in the decision tree based on user input and edge keywords.
  - Implements the Rule of Five to manage memory efficiently using move semantics.

## Project Structure

- **`src/`**: Contains the source files implementing the project logic.
- **`include/`**: Header files for each class.
- **`CMakeLists.txt`**: The CMake configuration file.
- **`Makefile`**: The Makefile to manage setup, build, and formatting tasks.
