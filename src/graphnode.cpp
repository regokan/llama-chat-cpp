#include "graphnode.h"
#include "graphedge.h"

GraphNode::GraphNode(int id) { _id = id; }

GraphNode::~GraphNode() {
  //// STUDENT CODE
  ////

  // delete _chatBot;
  // Commented out because GraphNode does not own the ChatBot instance.
  // ChatLogic owns and manages the lifecycle of the ChatBot,
  // so GraphNode should not be responsible for deleting it.

  ////
  //// EOF STUDENT CODE
}

void GraphNode::AddToken(std::string token) { _answers.push_back(token); }

void GraphNode::AddEdgeToChildNode(std::unique_ptr<GraphEdge> edge) {
  _childEdges.push_back(std::move(edge));
}

void GraphNode::AddEdgeToParentNode(GraphEdge *edge) {
  _parentEdges.push_back(edge);
}

//// STUDENT CODE
////
void GraphNode::MoveChatbotHere(ChatBot &&chatbot) {
  if (_chatBot) {
    // Move assignment operator will be called here if _chatBot already exists
    *_chatBot = std::move(chatbot);
  } else {
    // Move constructor will be called here if _chatBot does not exist
    _chatBot = std::make_unique<ChatBot>(std::move(chatbot));
  }
  _chatBot->SetCurrentNode(this);
}

void GraphNode::MoveChatbotToNewNode(GraphNode *newNode) {
  // If _chatBot exists, move the actual ChatBot object (not just the
  // unique_ptr)
  if (_chatBot) {
    newNode->MoveChatbotHere(std::move(*_chatBot));
    _chatBot.reset();  // Clear the unique_ptr after moving
  }
}
////
//// EOF STUDENT CODE

GraphEdge *GraphNode::GetChildEdgeAtIndex(int index) {
  //// STUDENT CODE
  ////

  return _childEdges[index].get();

  ////
  //// EOF STUDENT CODE
}