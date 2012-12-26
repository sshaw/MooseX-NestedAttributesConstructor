package MooseX::NestedAttributesConstructor;
use Moose;
our $VERSION = '0.01';

Moose::Exporter->setup_import_methods(
    # class_metaroles => {
    # 	class => ['MooseX::NestedAttributesConstructor::Trait::Class']
    # }
    base_class_roles => ['MooseX::NestedAttributesConstructor::Class']
);

package MooseX::NestedAttributesConstructor::Meta::Trait::NestedAttribute;
use Moose::Role;
Moose::Util::meta_attribute_alias('NestedAttribute');

1;

=pod

=head1 NAME

MooseX::NestedAttributesConstructor - Create attributes from a nested data structure

=head1 OVERVIEW

  package Address
  use Moose;

  has street => ( is => 'rw' );
  has city   => ( is => 'rw' );
  # ...

  package Person;
  use Moose;

  has name      => ( is => 'rw' );
  has addresses => ( is     => 'rw',
    		     isa    => 'ArrayRef[Address]',
    		     traits => ['NestedAttribute'] );
  # ...

  package main;
  use Person;

  my $p = Person->new(name      => 'sshaw',
    		      addresses => [
    			{ city => 'LA' },
    			{ city => 'Da Bay' },
			{ city => 'Even São José' }
     		      ]);

  say $_->city for @{$p->addresses};

=head1 WARNING

This is the first Moose I've cooked. 

=head1 DESCRIPTION

This module creates attribute types from a nested data structure passed to an object's constructor.
Just add the C<NestedAttrubute> trait to attributes with a custom or parameterized type.

=head1 AUTHOR

Skye Shaw (sshaw AT lucas.cis.temple.edu) 

=head1 SEE ALSO

L<MooseX::StrictConstructor>

=head1 COPYRIGHT

Copyright (c) 2012 Skye Shaw.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
