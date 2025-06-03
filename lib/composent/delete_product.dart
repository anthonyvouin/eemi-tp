import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteProductDialog extends StatefulWidget {
  final String productId;
  const DeleteProductDialog({super.key, required this.productId});

  @override
  State<DeleteProductDialog> createState() => _DeleteProductDialogState();
}

class _DeleteProductDialogState extends State<DeleteProductDialog> {
  bool _isLoading = false;

  Future<void> _deleteProduct() async {
    setState(() => _isLoading = true);
    final url =
        'https://eemi-39b84a24258a.herokuapp.com/products/${widget.productId}';
    final response = await http.delete(Uri.parse(url));
    setState(() => _isLoading = false);
    if (response.statusCode == 204) {
      if (mounted) Navigator.of(context).pop(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la suppression')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Supprimer le produit'),
      content: const Text('Voulez-vous vraiment supprimer ce produit ?'),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(false),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _deleteProduct,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Supprimer'),
        ),
      ],
    );
  }
}
